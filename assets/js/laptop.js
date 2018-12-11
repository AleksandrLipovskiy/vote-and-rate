"use strict";

class Laptop {
	constructor(laptopScreen) {
		this.laptop = laptopScreen.parentElement
		this.laptopScreen = laptopScreen
		this.ratioWidth = 0.625
		this.ratioHeight = 0.385
		this.translateX = 0.127
		this.translateY = 0.138

		this.setUp()
	}

	setUp() {
		this.setScreenSize()

		window.addEventListener("resize", () => {
			this.setScreenSize()
		})
	}

	setScreenSize() {
		this.setScreenStyle(this.laptop.clientWidth)
	}

	setScreenStyle(laptopWidth) {
		this.laptopScreen.style.cssText = `
		  width: ${ laptopWidth * this.ratioWidth }px;
		  height: ${ laptopWidth * this.ratioHeight}px;
		  -webkit-transform: 
		    rotate(-30deg) 
		    translate(-${ laptopWidth * this.translateX }px, ${ laptopWidth * this.translateY }px) 
		    skewX(-30deg);
      transform: 
        rotate(-30deg) 
        translate(-${ laptopWidth * this.translateX }px, ${ laptopWidth * this.translateY }px) 
        skewX(-30deg);
		`
	}

	animation() {
		const votingAnimation = async () => {
			await this.pauseBetween()
			await this.stepAnimation("one")
			await this.pauseBetween()
			await this.stepAnimation("two")
			await this.pauseBetween()
			await this.stepAnimation("three")
			await this.pauseBetween()
			await this.pauseBetween()
			await this.stepAnimation("four")
			await this.pauseBetween()
			await this.stepAnimation("five")
		}

		votingAnimation().then(() => {
      this.canselAnimationScreen()
    }).catch((err) => { console.log(err.message) })
	}

	pauseBetween() {
		return new Promise((resolve, reject) => {
			setTimeout(() => { resolve() }, 2000)
		})
  }

  stepAnimation(step) {
  	return new Promise((resolve, reject) => {
  	  this.laptopScreen.classList.add(`animation-step-${step}`)

  	  resolve()
  	})
  }

	canselAnimationScreen() {
		this.laptopScreen.classList.add("cansel-animation")
	}
}

export default Laptop
