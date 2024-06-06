import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/custom_appbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'preferences_model.dart';
export 'preferences_model.dart';

class PreferencesWidget extends StatefulWidget {
  const PreferencesWidget({super.key});

  @override
  State<PreferencesWidget> createState() => _PreferencesWidgetState();
}

class _PreferencesWidgetState extends State<PreferencesWidget> {
  late PreferencesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PreferencesModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Preferences'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PREFERENCES_Preferences_ON_INIT_STATE');
      logFirebaseEvent('Preferences_update_app_state');
      FFAppState().userPreference =
          (currentUserDocument?.userPreference.toList() ?? [])
              .toList()
              .cast<String>();
      setState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        wrapWithModel(
                          model: _model.customAppbarModel,
                          updateCallback: () => setState(() {}),
                          child: CustomAppbarWidget(
                            backButton: true,
                            actionButton: false,
                            optionsButton: false,
                            actionButtonAction: () async {},
                            optionsButtonAction: () async {},
                          ),
                        ),
                        Flexible(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 24.0, 0.0, 0.0),
                                child: Text(
                                  'Update your preference(s)',
                                  style: FlutterFlowTheme.of(context)
                                      .displaySmall
                                      .override(
                                        fontFamily: 'Outfit',
                                        fontSize: 28.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 30.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Container(
                                          height: 200.0,
                                          decoration: const BoxDecoration(
                                            color: Colors.transparent,
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              AuthUserStreamWidget(
                                                builder: (context) => Theme(
                                                  data: ThemeData(
                                                    checkboxTheme:
                                                        const CheckboxThemeData(
                                                      visualDensity:
                                                          VisualDensity.compact,
                                                      materialTapTargetSize:
                                                          MaterialTapTargetSize
                                                              .shrinkWrap,
                                                      shape: CircleBorder(),
                                                    ),
                                                    unselectedWidgetColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .rizz,
                                                  ),
                                                  child: Checkbox(
                                                    value: _model
                                                            .checkboxValue1 ??=
                                                        (currentUserDocument
                                                                    ?.userPreference
                                                                    .toList() ??
                                                                [])
                                                            .contains('Noli'),
                                                    onChanged:
                                                        (newValue) async {
                                                      setState(() => _model
                                                              .checkboxValue1 =
                                                          newValue!);
                                                      if (newValue!) {
                                                        logFirebaseEvent(
                                                            'PREFERENCES_Checkbox_m86zvkm5_ON_TOGGLE_');
                                                        logFirebaseEvent(
                                                            'Checkbox_update_app_state');
                                                        FFAppState()
                                                            .addToUserPreference(
                                                                'Noli');
                                                      } else {
                                                        logFirebaseEvent(
                                                            'PREFERENCES_Checkbox_m86zvkm5_ON_TOGGLE_');
                                                        logFirebaseEvent(
                                                            'Checkbox_update_app_state');
                                                        FFAppState()
                                                            .removeFromUserPreference(
                                                                'Noli');
                                                      }
                                                    },
                                                    side: BorderSide(
                                                      width: 2,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .rizz,
                                                    ),
                                                    activeColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .success,
                                                    checkColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: FlipCard(
                                                  fill: Fill.fillBack,
                                                  direction:
                                                      FlipDirection.HORIZONTAL,
                                                  speed: 300,
                                                  front: Container(
                                                    width: 300.0,
                                                    height: 200.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .redwood,
                                                      boxShadow: const [
                                                        BoxShadow(
                                                          blurRadius: 3.0,
                                                          color:
                                                              Color(0x33000000),
                                                          offset: Offset(
                                                            7.5,
                                                            7.5,
                                                          ),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          const BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                12.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        topRight:
                                                            Radius.circular(
                                                                12.0),
                                                      ),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'assets/images/SISA_-_card.png',
                                                        width: 300.0,
                                                        height: 200.0,
                                                        fit: BoxFit.cover,
                                                        alignment: const Alignment(
                                                            0.0, -1.0),
                                                      ),
                                                    ),
                                                  ),
                                                  back: Container(
                                                    width: 300.0,
                                                    height: 200.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .redwood,
                                                      boxShadow: const [
                                                        BoxShadow(
                                                          blurRadius: 3.0,
                                                          color:
                                                              Color(0x33000000),
                                                          offset: Offset(
                                                            7.5,
                                                            7.5,
                                                          ),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          const BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                12.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        topRight:
                                                            Radius.circular(
                                                                12.0),
                                                      ),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'Tap circle on left to select/unselect',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  fontSize: 9.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Text(
                                                              'NOLI ME TANGERE',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Plus Jakarta Sans',
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Container(
                                          height: 200.0,
                                          decoration: const BoxDecoration(
                                            color: Colors.transparent,
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              AuthUserStreamWidget(
                                                builder: (context) => Theme(
                                                  data: ThemeData(
                                                    checkboxTheme:
                                                        CheckboxThemeData(
                                                      visualDensity:
                                                          VisualDensity.compact,
                                                      materialTapTargetSize:
                                                          MaterialTapTargetSize
                                                              .shrinkWrap,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                    ),
                                                    unselectedWidgetColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .rizz,
                                                  ),
                                                  child: Checkbox(
                                                    value: _model
                                                            .checkboxValue2 ??=
                                                        (currentUserDocument
                                                                    ?.userPreference
                                                                    .toList() ??
                                                                [])
                                                            .contains('Elfili'),
                                                    onChanged:
                                                        (newValue) async {
                                                      setState(() => _model
                                                              .checkboxValue2 =
                                                          newValue!);
                                                      if (newValue!) {
                                                        logFirebaseEvent(
                                                            'PREFERENCES_Checkbox_g3a4s69b_ON_TOGGLE_');
                                                        logFirebaseEvent(
                                                            'Checkbox_update_app_state');
                                                        FFAppState()
                                                            .addToUserPreference(
                                                                'Elfili');
                                                      } else {
                                                        logFirebaseEvent(
                                                            'PREFERENCES_Checkbox_g3a4s69b_ON_TOGGLE_');
                                                        logFirebaseEvent(
                                                            'Checkbox_update_app_state');
                                                        FFAppState()
                                                            .removeFromUserPreference(
                                                                'Elfili');
                                                      }
                                                    },
                                                    side: BorderSide(
                                                      width: 2,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .rizz,
                                                    ),
                                                    activeColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .success,
                                                    checkColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: FlipCard(
                                                  fill: Fill.fillBack,
                                                  direction:
                                                      FlipDirection.HORIZONTAL,
                                                  speed: 300,
                                                  front: Container(
                                                    width: 300.0,
                                                    height: 200.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .redwood,
                                                      boxShadow: const [
                                                        BoxShadow(
                                                          blurRadius: 3.0,
                                                          color:
                                                              Color(0x33000000),
                                                          offset: Offset(
                                                            7.5,
                                                            7.5,
                                                          ),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          const BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                12.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        topRight:
                                                            Radius.circular(
                                                                12.0),
                                                      ),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'assets/images/JULI_-_card.png',
                                                        width: 300.0,
                                                        height: 200.0,
                                                        fit: BoxFit.cover,
                                                        alignment: const Alignment(
                                                            0.0, -1.0),
                                                      ),
                                                    ),
                                                  ),
                                                  back: Container(
                                                    width: 300.0,
                                                    height: 200.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .redwood,
                                                      boxShadow: const [
                                                        BoxShadow(
                                                          blurRadius: 3.0,
                                                          color:
                                                              Color(0x33000000),
                                                          offset: Offset(
                                                            7.5,
                                                            7.5,
                                                          ),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          const BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                12.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        topRight:
                                                            Radius.circular(
                                                                12.0),
                                                      ),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'Tap circle on left to select/unselect',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  fontSize: 9.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Text(
                                                              'EL FILIBUSTERISMO',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Plus Jakarta Sans',
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ].divide(const SizedBox(height: 50.0)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 32.0),
                child: FFButtonWidget(
                  onPressed: (FFAppState().userPreference.isEmpty)
                      ? null
                      : () async {
                          logFirebaseEvent(
                              'PREFERENCES_PAGE_UPDATE\n_BTN_ON_TAP');
                          logFirebaseEvent('Button_haptic_feedback');
                          HapticFeedback.lightImpact();
                          logFirebaseEvent('Button_backend_call');

                          await currentUserReference!.update({
                            ...mapToFirestore(
                              {
                                'user_preference': FFAppState().userPreference,
                              },
                            ),
                          });
                          logFirebaseEvent('Button_update_app_state');
                          FFAppState().userPreference = [];
                          logFirebaseEvent('Button_navigate_back');
                          context.safePop();
                        },
                  text: 'Update\n',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 50.0,
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).rizz,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Plus Jakarta Sans',
                          letterSpacing: 0.0,
                        ),
                    elevation: 3.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(25.0),
                    disabledColor: const Color(0xFF767676),
                    disabledTextColor: const Color(0xFF929292),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
