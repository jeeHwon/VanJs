const form = document.querySelector(".js-form");
    input = form.querySelector("input"),
    book = document.querySelector(".js-book")

const BOOK_LS = "currentBook",
    SHOWING_CN = "showing";

function saveBook(text){
    localStorage.setItem(BOOK_LS, text)
}

function handleSubmit(event){
    event.preventDefault();
    const currentValue = input.value;
    searchBook(currentValue);
    saveBook(currentValue);
}

function askForBook(){
    form.classList.add(SHOWING_CN);
    form.addEventListener("submit", handleSubmit)

}


function searchBook(text){
    form.classList.remove(SHOWING_CN);
    book.classList.add(SHOWING_CN);
    
}

function loadBook(){
    const currentBook = localStorage.getItem(BOOK_LS);
    if(currentBook===null){
        askForBook();
        
    } else{
        searchBook(currentBook);
    }
}

function init(){
    loadBook();
}

init();
