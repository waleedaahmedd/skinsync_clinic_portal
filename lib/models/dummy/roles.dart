final List<String> modules = ['Doctors', 'Staff', 'Clinics', 'Inventory'];
final List<Feature> feature = [
  Feature(
    featureId: 1,
    featureName: 'Doctor',
    actions: [
      Action(actionId: 1, actionName: "Create"),
      Action(actionId: 2, actionName: "Update"),
      Action(actionId: 3, actionName: "Delete"),
    ],
  ),
  Feature(
    featureId: 1,
    featureName: 'Staff',
    actions: [
      Action(actionId: 4, actionName: "View"),
      Action(actionId: 5, actionName: "Edit"),
      Action(actionId: 6, actionName: "Delete"),
    ],
  ),
  Feature(
    featureId: 1,
    featureName: 'Clinic',
    actions: [
      Action(actionId: 7, actionName: "Create"),
      Action(actionId: 8, actionName: "Update"),
      Action(actionId: 9, actionName: "Delete"),
      Action(actionId: 10, actionName: "View"),
    ],
  ),
];
final List<String> permissionsList = ['Create', 'Update', 'Delete'];

class Feature {
  int? featureId;
  String? featureName;
  List<Action>? actions;

  Feature({
    required this.featureId,
    required this.featureName,
    required this.actions,
  });
}

class Action {
  final String actionName;
  final int actionId;
  Action({required this.actionId, required this.actionName});
}
