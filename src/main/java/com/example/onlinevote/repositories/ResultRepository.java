package com.example.onlinevote.repositories;

import com.example.onlinevote.models.*;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ResultRepository extends CrudRepository<Result, Integer> {
    List<Result> getAllByQuestionQuiz(Quiz quiz);
    List<Result> getAllByQuestionQuizAndUserGroup(Quiz quiz, Group user_group);
    List<Result> getByQuestionQuizAndUser(Quiz question_quiz, User user);
    List<Result> getAllByQuestion(Question question);

}
