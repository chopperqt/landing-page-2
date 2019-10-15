import React from 'react';
import "./style.css";

import Cart_img from '../../../templates/cart.png';

const Cart = ({}) => {
    return (
        <section className="cart">
            <div className="cart__header">
                <h3>The Shopping Cart</h3>
            </div>
            <div className="container">
                <div className="cart__img">
                    <img src={Cart_img} alt="Cart"/>
                </div>
                <div className="cart__text">
                    <div className="cart__off_header">
                        <h4>Some Bullet text here</h4>
                        <ul>
                            <li>Lorem Ipsum is simply dummy text of the printing and typesetting</li>
                            <li>Lorem Ipsum has been the industry's standard dummy text ever</li>
                            <li>When an unknown printer took a galley of type and scrambled</li>
                            <li>It to make a type specimen book. It has survived not only five centuries</li>
                            <li>But also the leap into electronic typesetting</li>
                            <li>Remaining essentially unchanged. It was popularised</li>
                            <li>The release of Letraset sheets containing Lorem Ipsum passages</li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
    )
}
export default Cart;