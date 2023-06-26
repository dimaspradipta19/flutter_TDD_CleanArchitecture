import 'package:flutter_tdd_clean_architecture/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_tdd_clean_architecture/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:flutter_tdd_clean_architecture/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
// import 'package:mockito/mockito.dart';
import 'package:mocktail/mocktail.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  GetConcreteNumberTrivia? usecase;
  MockNumberTriviaRepository? mockNumberTriviaRepository;
  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository!);
  });

  const tNumber = 1;
  const tNumberTrivia = NumberTrivia(text: "test", number: 1);

  test(
    "should get trivia for the number from trivia repository",
    () async {
      // arrange

      // using mockito package
      // when(mockNumberTriviaRepository!.getConcreteNumberTrivia(any()))
      //     .thenAnswer((_) async => Right(tNumberTrivia));

      // using mocktail package
      when(() => mockNumberTriviaRepository!.getConcreteNumberTrivia(any()))
          .thenAnswer((_) async => const Right(tNumberTrivia));

      // act
      final result = await usecase!(const Params(tNumber));

      // assert
      expect(result, const Right(tNumberTrivia));

      // using mockito package
      // verify(() => mockNumberTriviaRepository!.getConcreteNumberTrivia(42));

      // using mocktail package
      verify(
          () => mockNumberTriviaRepository!.getConcreteNumberTrivia(tNumber));
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    },
  );
}
