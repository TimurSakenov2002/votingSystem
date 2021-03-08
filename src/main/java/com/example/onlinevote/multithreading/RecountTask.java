package com.example.onlinevote.multithreading;

import com.example.onlinevote.models.Result;
import com.example.onlinevote.models.User;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.stream.Collectors;

public class RecountTask implements Callable<List<User>> {
    private final List<Result> resultList;

    public RecountTask(List<Result> resultList) {
        this.resultList = resultList;
    }


    public synchronized List<User> recount() {
        List<Result> collect = resultList.stream().filter(Result::isTrue).collect(Collectors.toList());
        List<User> users = new ArrayList<>();
        collect.forEach(e -> users.add(e.getUser()));
        return users;
    }

    public List<Result> getResultList() {
        return resultList;
    }


    @Override
    public List<User> call() throws Exception {
        return recount();
    }
}
