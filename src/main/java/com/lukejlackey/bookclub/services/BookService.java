package com.lukejlackey.bookclub.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lukejlackey.bookclub.models.Book;
import com.lukejlackey.bookclub.repositories.BookRepository;

@Service
public class BookService {
	
	@Autowired
	private BookRepository bookRepo;

	public List<Book> findAll() {
		return bookRepo.findAll();
	}
	
	public Book findById(Long id) {
		Optional<Book> optionalBook = bookRepo.findById(id);
		if(optionalBook.isPresent()) {
			return optionalBook.get();
		}
		return null;
	}
	
	public Book createBook(Book newBook) {
		return bookRepo.save(newBook);
	}
	
	public Book editBook(Book book) {
		return bookRepo.save(book);
	}
	
	public void deleteBook(Book book) {
		bookRepo.deleteById(book.getId());
		return;
	}
	
}
