import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSalePointsScreen extends StatefulWidget {
  const MapSalePointsScreen({super.key});

  @override
  State<MapSalePointsScreen> createState() => _SimpleGeoMapScreenState();
}

class _SimpleGeoMapScreenState extends State<MapSalePointsScreen> {
  // Controlador del mapa
  GoogleMapController? _mapController;

  static const LatLng _defaultLocation = LatLng(4.6097, -74.0817);

  final Set<Marker> _markers = {
    const Marker(
      markerId: MarkerId('shop-1'),
      position: LatLng(4.699434, -74.129139),
      infoWindow: InfoWindow(title: 'Punto fisico numero 1'),
    ),
    const Marker(
      markerId: MarkerId('shop-2'),
      position: LatLng(4.668956, -74.073323),
      infoWindow: InfoWindow(title: 'Punto fisico numero 2'),
    ),
  };

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  // Función para obtener la ubicación actual
  Future<void> _getCurrentLocation() async {
    // Verificar permisos de ubicación
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        _updateMap(_defaultLocation);
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      _updateMap(_defaultLocation);
      return;
    }

    try {
      // Obtener la posición actual
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Actualizar el mapa con la ubicación actual
      _updateMap(LatLng(position.latitude, position.longitude));
    } catch (e) {
      // En caso de error, usamos la ubicación por defecto
      _updateMap(_defaultLocation);
    }
  }

  // Actualizar el mapa y añadir marcador
  void _updateMap(LatLng position) {
    setState(() {
      // Añadir marcador de la ubicación actual
      _markers.add(
        Marker(
          markerId: const MarkerId('current_location'),
          position: position,
          infoWindow: const InfoWindow(title: 'Mi ubicación'),
        ),
      );

      // Actualizar estado de carga
      _isLoading = false;
    });

    // Mover cámara a la ubicación
    _mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: position, zoom: 12),
      ),
    );
  }

  // Añadir marcador al tocar el mapa
  void _addMarkerOnTap(LatLng position) {
    setState(() {
      // Eliminar marcador anterior si existe
      _markers.removeWhere(
        (marker) => marker.markerId.value == 'selected_location',
      );

      // Añadir nuevo marcador
      _markers.add(
        Marker(
          markerId: const MarkerId('selected_location'),
          position: position,
          infoWindow: InfoWindow(
            title: 'Ubicación seleccionada',
            snippet: '${position.latitude}, ${position.longitude}',
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        ),
      );
    });
  }

  // Guardar la ubicación seleccionada
  void _saveLocation() {
    // Buscar el marcador seleccionado
    final selectedMarker = _markers.firstWhere(
      (marker) => marker.markerId.value == 'selected_location',
      orElse: () => const Marker(markerId: MarkerId('')),
    );

    if (selectedMarker.markerId.value.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor selecciona una ubicación primero'),
        ),
      );
      return;
    }

    // Para este ejemplo, solo mostramos un mensaje
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Ubicación guardada: ${selectedMarker.position.latitude}, ${selectedMarker.position.longitude}',
        ),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Mapa de Google
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: _defaultLocation,
              zoom: 30,
            ),
            markers: _markers,
            onMapCreated: (controller) {
              _mapController = controller;
            },
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            onTap: _addMarkerOnTap,
          ),

          // Indicador de carga
          if (_isLoading) const Center(child: CircularProgressIndicator()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getCurrentLocation,
        child: const Icon(Icons.my_location),
        tooltip: 'Mi ubicación',
      ),
    );
  }
}
