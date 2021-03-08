package com.example.onlinevote.multithreading;

import com.example.onlinevote.models.Result;
import com.example.onlinevote.models.User;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

@Component
public class RecountService implements Recount {
    private final ExecutorService executorService = Executors.newFixedThreadPool(Runtime.getRuntime().availableProcessors());

    @Override
    public List<User> recount(List<Result> resultList) {
        Future<List<User>> submit = executorService.submit(new RecountTask(resultList));
        try {
            return submit.get();
        } catch (InterruptedException | ExecutionException e) {
            e.printStackTrace();
        }
        return null;
    }
}
