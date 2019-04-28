package com.lw.jskh.entity;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class Teacher1 {
    private int id1;
    private String trueName1;//真实姓名
    private int teamScore1; //团队负责人给分
    private int myselftScore1; //自评得分


    public Teacher1(int id1, String trueName1, int teamScore1, int myselftScore1) {
        this.id1 = id1;
        this.trueName1 = trueName1;
        this.teamScore1 = teamScore1;
        this.myselftScore1 = myselftScore1;
    }

    public int getId1() {
        return id1;
    }

    public void setId1(int id1) {
        this.id1 = id1;
    }

    public String getTrueName1() {
        return trueName1;
    }

    public void setTrueName1(String trueName1) {
        this.trueName1 = trueName1;
    }

    public int getMyselftScore1() {
        return myselftScore1;
    }

    public void setMyselftScore1(int myselftScore1) {
        this.myselftScore1 = myselftScore1;
    }

    public int getTeamScore1() {
        return teamScore1;
    }

    public void setTeamScore1(int teamScore1) {
        this.teamScore1 = teamScore1;
    }
    public static List<Teacher1> sortCard(List<Teacher1> list){
        Collections.sort(list, new Comparator<Teacher1>() {
            @Override
            public int compare(Teacher1 o1, Teacher1 o2) {
                return o2.getTeamScore1()-o1.getTeamScore1();
            }
        });
        return list;
    }
}
