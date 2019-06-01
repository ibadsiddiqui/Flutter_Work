Future lookUpVersion() async {
  return "something";
}

Future checkVersion() async {
  return await lookUpVersion();
  // Do something with version
}

Future main() async {
  print('In main: version is ${await checkVersion()}');
}
