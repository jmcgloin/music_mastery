
document.addEventListener('click', (e) => {
	if(e.target && e.target.id == 'close') {
		e.target.parentNode.classList.add('hidden')
	}

})