import 'package:adoptini_app/common/adoptini_router.dart';
import 'package:adoptini_app/common/loading_screen.dart';
import 'package:adoptini_app/common/theme/adoptini_colors.dart';
import 'package:adoptini_app/core/home/data/models/pet_model.dart';
import 'package:adoptini_app/core/home/presentation/cubit/pet_cubit/pet_cubit.dart';
import 'package:adoptini_app/core/home/presentation/widgets/vertical_list_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  void initState() {
    addCustomIcon();
    _setUpLocations();
    super.initState();
  }

  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  late List<PetModel> pets;

  late Position position;

  late GoogleMapController myController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  Widget _mapWidget() {
    print("MARKERS ====> ${markers.values}");
    final mymarkers = Set<Marker>.of(markers.values);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: AdoptiniColors.mainColor,
        leading: IconButton(
          icon: const Icon(FontAwesomeIcons.arrowLeft),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      extendBodyBehindAppBar: true,
      body: GoogleMap(
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        mapType: MapType.terrain,
        markers: mymarkers,
        onMapCreated: (GoogleMapController controller) {
          myController = controller;
        },
        initialCameraPosition: CameraPosition(target: LatLng(position.latitude, position.longitude), zoom: 12.0),
      ),
    );
  }

  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(const ImageConfiguration(), "assets/images/paw.png").then(
      (icon) {
        setState(() {
          markerIcon = icon;
        });
      },
    );
  }

  void initMarker({required PetModel pet, required String petID}) async {
    final lng = pet.longitude;
    final lat = pet.latitude;
    final MarkerId markerId = MarkerId(petID);
    final Marker marker = Marker(
      icon: markerIcon,
      markerId: markerId,
      position: LatLng(lat, lng),
      onTap: () {
        final snackbar = SnackBar(
          content: InkWell(
            onTap: () {
              Navigator.pushNamed(context, AdoptiniRouter.petScreen, arguments: pet);

              ScaffoldMessenger.of(context).removeCurrentSnackBar();
            },
            child: VerticalListViewWidget(pet: pet),
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,
        );
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      },
    );
    setState(() {
      markers[markerId] = marker;
    });
  }

  void _setUpLocations() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }

    Position res = await Geolocator.getCurrentPosition();
    setState(() {
      position = res;
      pets = context.read<PetCubit>().fetchedPets;
      for (var pet in pets) {
        initMarker(pet: pet, petID: pet.petId);
      }
      _child = _mapWidget();
    });
  }

  Widget _child = const LoadingScreen();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: _child,
    );
  }
}
