package com.example.ClassOnline.release_test.dao;

import com.example.ClassOnline.release_test.model.Test;

import java.util.List;

public interface TestDAO {
    int addTest(Test test);
    List<Test> getAllTests();
    Test getTestById(int testId);
}
