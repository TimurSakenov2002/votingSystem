package com.example.onlinevote.controllers;

import com.example.onlinevote.models.*;
import com.example.onlinevote.multithreading.Recount;
import com.example.onlinevote.repositories.QuestionRepository;
import com.example.onlinevote.repositories.ResultRepository;
import com.example.onlinevote.repositories.ScoreRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/question")
public class QuestionController {
    @Autowired
    private final QuestionRepository questionRepository;
    @Autowired
    private final Recount recountService;
    @Autowired
    private final ResultRepository resultRepository;
    @Autowired
    private final ScoreRepository scoreRepository;

    public QuestionController(QuestionRepository questionRepository, Recount recountService, ResultRepository resultRepository, ScoreRepository scoreRepository) {
        this.questionRepository = questionRepository;
        this.recountService = recountService;
        this.resultRepository = resultRepository;
        this.scoreRepository = scoreRepository;
    }

    @PostMapping("/remove/{question}")
    public String removeQuestion(@PathVariable(name = "question") Question question) {
        questionRepository.delete(question);
        return "redirect:/quiz/details/" + question.getQuiz().getId();
    }

    @GetMapping("/edit/{question}")
    public String editQuestion(Model model, @PathVariable(name = "question") Question question) {

        model.addAttribute("question",question);

        return "question-edit-page";
    }
    @PostMapping("/edit")
    public String editQuestionPost(@ModelAttribute Question question) {

        Question question1=questionRepository.save(question);

        List<Result> resultList=resultRepository.getAllByQuestion(question1);
        Quiz quiz= question.getQuiz();

        recountService.recount(resultList).forEach(e->{

            Score score=scoreRepository.getByUserAndQuiz(e,quiz);
            score.addScore();
            scoreRepository.save(score);

        });

        return "redirect:/quiz/details/" + question1.getQuiz().getId();
    }

}
