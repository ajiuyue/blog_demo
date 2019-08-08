package com.example.dto;

/**
 * Create bySeptember
 * 2019/8/3
 * 16:26
 */
public class ArchiveDTO {
    private String year;
    private String month;
    private Integer count;

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    @Override
    public String toString() {
        return "ArchiveDTO{" +
                "year='" + year + '\'' +
                ", month='" + month + '\'' +
                ", count=" + count +
                '}';
    }
}
