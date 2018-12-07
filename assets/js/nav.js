"use strict";

const nav = {
	clickTrigger: function(el) {
		el.classList.toggle('nav-is-open');
	},

	open: function(el) {
		el.classList.add('nav-is-open');
	},

	close: function(el) {
		el.classList.remove('nav-is-open');
	}
}

export default nav