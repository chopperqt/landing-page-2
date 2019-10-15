import React from 'react';
import Slider from "../component";

class SliderContainer extends React.Component{
    constructor(props) {
        super(props);
        this.state = {
            count: 0,
            arrow: ''
        }
    }
    // componentDidMount() {
    //     let left = document.querySelectorAll('.slider__container')[0];
    //     left.style.transition = ".5s ease-in-out";
    //     left.style.marginLeft = "0%";
    // }

    arrowRightClick(name) {
        let {count} = this.state;
        let item_count = document.querySelectorAll('.slider__container__item').length * 100;
        if (item_count - 100 > count) {
            this.setState({
                count: count + 100,
                arrow: name
            });
            console.log('item_count: ',item_count,' count: ',count)
        }

    }
    arrowLeftClick(name) {
        let {count} = this.state;
        if (count > 0) {
            this.setState({
                count: count - 100,
                arrow: name
            });
        }

    }
    rightClick() {
        let {count} = this.state;
        let left = document.querySelectorAll('.slider__container')[0];
        left.style.transition = ".5s ease-in-out";
        left.style.marginLeft = -count +"%";
    }
    leftClick() {
        let {count} = this.state;
        let left = document.querySelectorAll('.slider__container')[0];
        left.style.transition = ".5s ease-in-out";
        left.style.marginLeft = -count +"%";
    }
    componentDidUpdate(prevProps, prevState, snapshot) {
        let {count,arrow} = this.state;
        if (count !== prevState.count) {
            if (arrow === "right") {
                this.rightClick()
            }else {
                this.leftClick()
                console.log(count)
            }
        }
    }

    render() {
        return (
            <Slider leftClick={this.arrowLeftClick.bind(this)} rightClick={this.arrowRightClick.bind(this)}/>
        );
    }
}
export default SliderContainer;