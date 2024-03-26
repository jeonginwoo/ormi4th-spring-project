package com.estsoft.springproject.domain.entity;

import com.estsoft.springproject.domain.dto.BoardRequest;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Getter
@Entity
@NoArgsConstructor
@EntityListeners(AuditingEntityListener.class)
public class Board {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="board_id",updatable = false)
    private Long id;

    @Column(name="type")
    private String type;

    @Column(name="team")
    private String team;

    @Column(name="title", nullable=false)
    private String title;

    @Column(name="content")
    private String content;

    @CreatedDate
    @Column(name = "created_at", updatable = false)
    private LocalDateTime createdAt;

    @LastModifiedDate
    @Column(name = "modified_at")
    private LocalDateTime modifiedAt;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

    @OneToMany(mappedBy = "board", cascade = CascadeType.ALL)
    private List<Comment> comments = new ArrayList<>();

    public Board(BoardRequest request, User user) {
        this.type = request.getType();
        this.team = request.getTeam();
        this.title = request.getTitle();
        this.content = request.getContent();
        this.user = user;
    }

    public void update(String title,String content){
        this.title = title;
        this.content = content;
    }
}