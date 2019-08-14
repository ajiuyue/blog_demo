package com.example.dto;

import com.example.model.Content;

/**
 * Create bySeptember
 * 2019/8/14
 * 21:52
 */
public class PreviousAndNextDTO {
    private Content previous;
    private Content next;

    public Content getPrevious() {
        return previous;
    }

    public void setPrevious(Content previous) {
        this.previous = previous;
    }

    public Content getNext() {
        return next;
    }

    public void setNext(Content next) {
        this.next = next;
    }
}
