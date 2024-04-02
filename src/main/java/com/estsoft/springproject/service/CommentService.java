package com.estsoft.springproject.service;

import com.estsoft.springproject.domain.dto.CommentRequest;
import com.estsoft.springproject.domain.entity.Board;
import com.estsoft.springproject.domain.entity.Comment;
import com.estsoft.springproject.domain.entity.User;
import com.estsoft.springproject.repository.CommentRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CommentService {
    private final CommentRepository commentRepository;

    public List<Comment> findByBoardId(Long boardId) {
        return commentRepository.findByBoard_IdAndParentNull(boardId);
    }

    public Comment findById(Long id) {
        if (id == null) return null;
        return commentRepository.findById(id).orElse(null);
    }

    public List<Comment> findChildren(Long parentId) {
        return commentRepository.findByParent_Id(parentId);
    }

    public Comment save(CommentRequest request, User user, Board board, Comment parent) {
        return commentRepository.save(new Comment(request, user, board, parent));
    }

    public Comment update(Comment comment) {
        return commentRepository.save(comment);
    }

    public void deleteById(Long id) {
        commentRepository.deleteById(id);
    }

	public int getTotalComments() {
        return (int)commentRepository.count();
	}
}
