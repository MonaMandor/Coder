import 'package:coder/core/constansts/context_extensions.dart';
import 'package:coder/moduls/auth/presentation/widgets/custom_buttom.dart';
import 'package:coder/moduls/deep_search/data/Disease.dart';
import 'package:coder/moduls/deep_search/presentation/cubit/cubit/disease_cubit_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class DiseaseSearchPage extends StatelessWidget {
  const DiseaseSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          top: context.propHeight(100),
          left: context.propWidth(50),
          right: context.propWidth(40),
          bottom: context.propHeight(100),
        ),
        child: Container(
          height: context.propHeight(1300),
          width: context.propWidth(700),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 243, 76, 159).withOpacity(0.4),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              SizedBox(
                height: context.propHeight(50),
              ),
              Text('You can search by the name of disease ',
                  style: TextStyle(
                    fontSize: context.propHeight(40),
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  )),
              SizedBox(
                height: context.propHeight(100),
              ),
              Column(
                children: [
                  SizedBox(
                    width: context.propWidth(350),
                    child: TextField(
                      onSubmitted: (searchText) {
                        context
                            .read<DiseaseCubitCubit>()
                            .deepSearch(searchText);
                      },
                      style: context.textTheme.bodyMedium!.copyWith(
                        color: Colors.black,
                        fontSize: context.propHeight(30),
                      ),
                      decoration: InputDecoration(
                        hintText: 'Enter name of diseases',
                        hintStyle: context.textTheme.bodyMedium!.copyWith(
                          color: Colors.grey,
                          fontSize: context.propHeight(30),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: EdgeInsets.only(
                          right: context.propWidth(14),
                          left: context.propWidth(14),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: context.propHeight(50),
                  ),
                  CustomButton(
                    color: Colors.blue, // Change to a shade of blue
                    height: context.propHeight(70),
                    width: context.propWidth(80),
                    onTap: () {
                      context.read<DiseaseCubitCubit>().clearSearch();
                    },
                    child: Text(
                      'Clear Results',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: context.propHeight(30),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: BlocConsumer<DiseaseCubitCubit, DiseaseCubitState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      //  print(state);
                      if (state is DiseaseCubitLoaded) {
                        return Padding(
                          padding: EdgeInsets.only(
                            left: context.propWidth(60),
                            right: context.propWidth(60),
                            bottom: context.propHeight(100),
                            top: context.propHeight(50),
                          ),
                          child: Container(
                            width: double.infinity,
                            height: context.propHeight(800),
                            decoration: ShapeDecoration(
                              gradient: LinearGradient(
                                begin: const Alignment(0.00, -1.00),
                                end: const Alignment(0, 1),
                                colors: [
                                  Colors.white.withOpacity(0.4),
                                  Colors.white.withOpacity(0.1),
                                ],
                              ),
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 1, color: Colors.white),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.result.length,
                              itemBuilder: (context, index) {
                                return MyDiseaseWidget(
                                  disease: state.result[index],
                                );
                              },
                            ),
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
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

class MyDiseaseWidget extends StatelessWidget {
  final Disease disease;
  const MyDiseaseWidget({super.key, required this.disease});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: context.propWidth(10),
                child: Divider(
                  color: Colors.black,
                  height: context.propHeight(10),
                  thickness: context.propHeight(1),
                ),
              ),
              Expanded(
                child: ExpansionTile(
                  title: Text(
                    disease.name,
                    style: TextStyle(
                      fontSize: context.propHeight(35),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    disease.code,
                    style: TextStyle(
                        fontSize: context.propHeight(25), color: Colors.white),
                  ),
                  children: [
                    if (disease.subDiseases.isNotEmpty)
                      for (var item in disease.subDiseases)
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            padding: EdgeInsets.only(
                              left: context.propWidth(30),
                            ),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 51, 9, 70)
                                  .withOpacity(
                                      0.1), // Adjust color and opacity here
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.blue, width: 1),
                            ),
                            child: MyDiseaseWidget(
                              disease: item,
                            ),
                          ),
                        )
                  ],
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.grey,
            height: context.propHeight(15),
            thickness: context.propHeight(1),
          ),
        ],
      ),
    );
  }
}
