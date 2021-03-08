package com.example.onlinevote.multithreading;

import com.example.onlinevote.models.Question;
import com.example.onlinevote.models.Result;
import com.example.onlinevote.models.User;

import java.util.List;

public interface Recount {
    List<User> recount(List<Result> resultList);
}
