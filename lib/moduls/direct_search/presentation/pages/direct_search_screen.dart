import 'package:coder/core/constansts/context_extensions.dart';
import 'package:coder/moduls/direct_search/data/ICD10Data.dart';
import 'package:coder/moduls/direct_search/presentation/pages/cubit/cubit/direct_search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';

class DirectSearchScreen extends StatelessWidget {
  const DirectSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
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
                  color: Color.fromARGB(255, 243, 76, 159).withOpacity(0.4),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: context.propHeight(50),
                    ),
                    Text(
                      'You can get the code or name of disease directly',
                      style: context.textTheme.bodyLarge,
                    ),
                    SizedBox(
                      height: context.propHeight(200),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: context.propWidth(200),
                          height: context.propHeight(600),
                          decoration: ShapeDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(0.00, -1.00),
                              end: Alignment(0, 1),
                              colors: [
                                Colors.white.withOpacity(0.4000000059604645),
                                Colors.white.withOpacity(0.10000000149011612)
                              ],
                            ),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1, color: Colors.white),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Text(
                                  'Search by code',
                                  style: context.textTheme.bodyMedium,
                                ),
                                SizedBox(
                                  height: context.propHeight(50),
                                ),
                                Container(
                                  height: context.propHeight(80),
                                  width: double.infinity,
                                  child: TextField(
                                    onChanged: (value) {
                                      context
                                          .read<DirectSearchCubit>()
                                          .SearchByCode(value);
                                    },
                                    style: context.textTheme.bodyMedium!
                                        .copyWith(
                                            color: Colors.black,
                                            fontSize: context.propHeight(30)),
                                    decoration: InputDecoration(
                                      hintText: 'Enter code of disseases',
                                      hintStyle: context.textTheme.bodyMedium!
                                          .copyWith(
                                              color: Colors.grey,
                                              fontSize: context.propHeight(20)),
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
                                BlocBuilder<DirectSearchCubit,
                                    DirectSearchState>(
                                  builder: (context, state) {
                                    if (state is SrarchByCode) {
                                      return Expanded(
                                        child: ListView.builder(
                                          itemCount: state.result.length,
                                          itemBuilder: (context, index) {
                                            final result = state.result[index];
                                            return Padding(
                                              padding: EdgeInsets.only(
                                                top: context.propHeight(30),
                                              ),
                                              child: Container(
                                                width: double.infinity,
                                                height: context.propHeight(200),
                                                // margin: EdgeInsets.only(bottom: context.propHeight(20)),
                                                decoration: BoxDecoration(
                                                    // color: Colors.white.withOpacity(.5),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    border: Border.all(
                                                        color: Colors.white,
                                                        width: 1)),
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height: context
                                                          .propHeight(20),
                                                    ),
                                                    // Text("The disease that has this code",style: context.textTheme.bodyMedium!.copyWith(color: Color.fromARGB(255, 253, 252, 252),fontSize: context.propHeight(30)),),

                                                    SizedBox(
                                                      height: context
                                                          .propHeight(20),
                                                    ),
                                                    Text(
                                                      result.disease,
                                                      style: context
                                                          .textTheme.bodyMedium!
                                                          .copyWith(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      253,
                                                                      253,
                                                                      253),
                                                              fontSize: context
                                                                  .propHeight(
                                                                      40)),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    } else {
                                      return SizedBox();
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: context.propWidth(200),
                            height: context.propHeight(600),
                            decoration: ShapeDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(0.00, -1.00),
                                end: Alignment(0, 1),
                                colors: [
                                  Colors.white.withOpacity(0.4000000059604645),
                                  Colors.white.withOpacity(0.10000000149011612)
                                ],
                              ),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1, color: Colors.white),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Text(
                                    'Search by name',
                                    style: context.textTheme.bodyMedium,
                                  ),
                                  SizedBox(
                                    height: context.propHeight(50),
                                  ),
                                  Container(
                                    height: context.propHeight(80),
                                    width: double.infinity,
                                    child: TextField(
                                      style: context.textTheme.bodyMedium!
                                          .copyWith(
                                              color: Colors.black,
                                              fontSize: context.propHeight(30)),
                                      onChanged: (value) {
                                        context
                                            .read<DirectSearchCubit>()
                                            .SearchByDisease(value);
                                      },
                                      decoration: InputDecoration(
                                        hintText: 'Enter name of disseases',
                                        hintStyle: context.textTheme.bodyMedium!
                                            .copyWith(
                                                color: Colors.grey,
                                                fontSize:
                                                    context.propHeight(20)),
                                        fillColor: Colors.white,
                                        filled: true,
                                        contentPadding: EdgeInsets.only(
                                          right: context.propWidth(14),
                                          left: context.propWidth(14),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                  BlocBuilder<DirectSearchCubit,
                                      DirectSearchState>(
                                    builder: (context, state) {
                                      if (state is SrarchByDisease) {
                                        return Expanded(
                                          child: ListView.builder(
                                            itemCount: state.result.length,
                                            itemBuilder: (context, index) {
                                              final result =
                                                  state.result[index];
                                              return Padding(
                                                padding: EdgeInsets.only(
                                                  top: context.propHeight(30),
                                                ),
                                                child: Container(
                                                  width: double.infinity,
                                                  height:
                                                      context.propHeight(200),
                                                  // margin: EdgeInsets.only(bottom: context.propHeight(20)),
                                                  decoration: BoxDecoration(
                                                      // color: Colors.white.withOpacity(.5),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      border: Border.all(
                                                          color: Colors.white,
                                                          width: 1)),
                                                  child: Column(
                                                    children: [
                                                      SizedBox(
                                                        height: context
                                                            .propHeight(20),
                                                      ),
                                                      // Text("The disease that has this code",style: context.textTheme.bodyMedium!.copyWith(color: Color.fromARGB(255, 253, 252, 252),fontSize: context.propHeight(30)),),

                                                      SizedBox(
                                                        height: context
                                                            .propHeight(20),
                                                      ),
                                                      Text(
                                                        result.code,
                                                        style: context.textTheme
                                                            .bodyMedium!
                                                            .copyWith(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        253,
                                                                        253,
                                                                        253),
                                                                fontSize: context
                                                                    .propHeight(
                                                                        40)),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      } else {
                                        return SizedBox();
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
