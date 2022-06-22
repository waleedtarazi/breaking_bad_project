import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import '../../businessLogic/cubit/characters_cubit.dart';
import '../../constants.dart';
import '../../data/models/character.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacteresDetilesScreen extends StatelessWidget {
  //const CharacteresDetiles({Key? key}) : super(key: key);

  final Character character;

  const CharacteresDetilesScreen({Key? key, required this.character})
      : super(key: key);

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: myGrey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          character.neckName,
          style: const TextStyle(
            color: myWhite,
            fontSize: 14,
          ),
        ),
        background: Hero(
          tag: character.charId,
          child: Image.network(
            character.img,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget characterInfo(String tittle, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(children: [
        TextSpan(
            text: tittle,
            style: const TextStyle(
                color: myWhite, fontWeight: FontWeight.bold, fontSize: 18)),
        TextSpan(
            text: value, style: const TextStyle(color: myWhite, fontSize: 14))
      ]),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      color: myYellow,
      height: 30,
      endIndent: endIndent,
      thickness: 2,
    );
  }

  Widget checkIfQoutesAreLoaded(CharactersState state) {
    if (state is QoutesLoaded) {
      return displyRandomQouteOrEmptySpace(state);
    } else {
      return showProgressIndicetor();
    }
  }

  Widget displyRandomQouteOrEmptySpace(state) {
    //todo : there's no quote showing in my application, and it's not navigating back!

    var quotes = (state).qoutes;
    if (quotes.length != 0) {
      int randomQuoteIndex = Random().nextInt(quotes.lenght - 1);
      return Center(
        child: DefaultTextStyle(
          textAlign: TextAlign.center,
          child: AnimatedTextKit(
            animatedTexts: [
              FlickerAnimatedText("this is animated hhahahah",
                  textStyle: const TextStyle(color: myWhite)),
            ],
            repeatForever: true,
          ),
          style: const TextStyle(fontSize: 20, color: myYellow, shadows: [
            Shadow(
              blurRadius: 7,
              color: myYellow,
              offset: Offset(0, 0),
            )
          ]),
        ),
      );
    } else {
      return const SizedBox(
        height: 0.0,
      );
    }
  }

  Widget showProgressIndicetor() {
    return const Center(
      child: CircularProgressIndicator(
        color: myYellow,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CharactersCubit>(context).getQoutes(character.name);

    return Scaffold(
      backgroundColor: myGrey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    characterInfo("Job: ", character.occupations.join(' / ')),
                    buildDivider(316),
                    characterInfo(
                        "Appeared in: ", character.catogiryForTwoSeries),
                    buildDivider(250),
                    characterInfo("Seasons: ",
                        character.apperanceBreakingBad.join(' / ')),
                    buildDivider(280),
                    characterInfo("Status: ", character.status),
                    buildDivider(300),
                    character.apperanceBetterCallSoul.isEmpty
                        ? Container()
                        : characterInfo("Better call Soul Seasons: ",
                            character.apperanceBetterCallSoul.join(' / ')),
                    character.apperanceBetterCallSoul.isEmpty
                        ? Container()
                        : buildDivider(150),
                    characterInfo("Actorr/Actress: ", character.actorName),
                    buildDivider(235),
                    const SizedBox(
                      height: 20,
                    ),

                    //todo :
                    BlocBuilder<CharactersCubit, CharactersState>(
                      builder: (context, state) {
                        return checkIfQoutesAreLoaded(state);
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 500,
              )
            ]),
          ),
        ],
      ),
    );
  }
}
