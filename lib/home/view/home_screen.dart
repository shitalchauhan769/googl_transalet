import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_translate/home/controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());
  TextEditingController txtText = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    controller.getLanguage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Google Translate"),
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              Card(
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: const Column(
                    children: [
                      Text(
                        "Google Translate",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("About Google Translate "),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: const Text("Privacy & Terms"),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: const Text("Help"),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: const Text("Send feedback"),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: const Text("About Google"),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Obx(
                () => Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        showSource();
                      },
                      child: const Text("DetectLanguage"),
                    ),
                    TextButton(
                      onPressed: () {
                        showSource();
                      },
                      child: Row(
                        children: [
                          Text(controller.lanIndex.value),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 25,
                            height: 25,
                            child: Image(
                              image: NetworkImage(controller.imageIndex1.value),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            showSource();
                          },
                          icon: const Icon(Icons.keyboard_arrow_down),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 300,
                width: MediaQuery.sizeOf(context).width,
                child: Card(
                  child: Container(
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: txtText,
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter data";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    controller.getTranslate(txtText.text,
                        controller.lanIndex1.value, controller.index1.value);

                    // txtText.clear();
                  }
                },
                child: const Text("Translate"),
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(
                () => Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        showTarget();
                      },
                      child: Row(
                        children: [
                          Text(controller.index.value),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 25,
                            height: 25,
                            child: Image(
                              image: NetworkImage(controller.imageIndex.value),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            showTarget();
                          },
                          icon: const Icon(Icons.keyboard_arrow_down),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 300,
                width: MediaQuery.sizeOf(context).width,
                child: Obx(
                  () => Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SelectableText(
                        controller.model.value != null
                            ? "${controller.model.value!.translations!.translation}"
                            : "",
                      ),
                    ),
                    // child: Text(controller.model.value!=null?"${controller.model.value!.text }":""),
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }

  void showSource() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          children: [
            Obx(
              () => Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: controller.langList.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Card(
                        child: SizedBox(
                          width: MediaQuery.sizeOf(context).width,
                          height: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: InkWell(
                                  onTap: () {
                                    controller.lanIndex.value =
                                        controller.langList[index].lang!;
                                    controller.lanIndex1.value =
                                        controller.langList[index].s1!;
                                    controller.imageIndex1.value =
                                        controller.langList[index].image!;

                                    Get.back();
                                  },
                                  child: Row(
                                    children: [
                                      Text("${controller.langList[index].lang}"),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      SizedBox(
                                        height: 25,
                                        width: 25,
                                        child: Image(
                                          image: NetworkImage(
                                              "${controller.langList[index].image}"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void showTarget() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          children: [
            Obx(
              () => Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: controller.langList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Center(
                          child: Card(
                            child: Container(
                              width: MediaQuery.sizeOf(context).width,
                              height: 100,
                              decoration: const BoxDecoration(),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Obx(
                                      () => InkWell(
                                        onTap: () {
                                          controller.index.value =
                                              controller.langList[index].lang!;
                                          controller.index1.value =
                                              controller.langList[index].s1!;
                                          controller.imageIndex.value =
                                              controller.langList[index].image!;

                                          Get.back();
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                                "${controller.langList[index].lang}"),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            SizedBox(
                                              height: 30,
                                              width: 30,
                                              child: Image(
                                                image: NetworkImage(
                                                    "${controller.langList[index].image}"),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
//   controller.getTranslate(txtText: txtText.text);
