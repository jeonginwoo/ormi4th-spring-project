package com.estsoft.springproject.domain.dto;

import com.estsoft.springproject.domain.entity.Board;
import com.estsoft.springproject.domain.entity.Comment;
import com.estsoft.springproject.domain.entity.User;
import lombok.*;

import java.sql.Timestamp;
import java.time.LocalDateTime;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CommentResponse {
    private Long commentId;
    private String content;
    private Timestamp createdAt;
    private Timestamp modifiedAt;
    private String nickname;
    private Long userId;
    private Long boardId;
    private Long parentId;
    private boolean isLike;
    private int likeNum;

    public CommentResponse(Comment comment) {
        this.commentId = comment.getId();
        this.content = comment.getContent();
        this.createdAt = comment.getCreatedAt();
        this.modifiedAt = comment.getModifiedAt();
        this.nickname = comment.getUser().getNickname();
        this.userId = comment.getUser().getId();
        this.boardId = comment.getBoard().getId();
        if (comment.getParent() != null) {
            this.parentId = comment.getParent().getId();
        }
    }
}
