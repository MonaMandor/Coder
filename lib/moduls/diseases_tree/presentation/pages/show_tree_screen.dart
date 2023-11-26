 // ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:coder/core/constansts/context_extensions.dart';
import 'package:coder/moduls/auth/presentation/widgets/custom_buttom.dart';
import 'package:coder/moduls/deep_search/data/Disease.dart';
import 'package:coder/moduls/deep_search/domain/load_data.dart';
import 'package:coder/moduls/deep_search/presentation/cubit/cubit/disease_cubit_cubit.dart';
import 'package:coder/moduls/diseases_tree/presentation/cubit/show_tree_cubit.dart';

class ShowTreeScreen extends StatelessWidget {
  ShowTreeScreen({
    Key? key,
  }) : super(key: key);

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
        child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
             // height: context.propHeight(800),
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
                  side: const BorderSide(width: 1, color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: BlocBuilder<ShowTreeCubit, ShowTreeState>(
                builder: (context, state) {
                   context.read<ShowTreeCubit>().showTree();
                  
                  if (state is ShowTreeLoaded) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.diseases.length,
                      itemBuilder: (context, index) {
                        return MyDiseaseWidget(
                          disease: state.diseases[index],
                        );
                      },
                    );
                  } else {
                    return Container();
                  }
                },
            ),
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