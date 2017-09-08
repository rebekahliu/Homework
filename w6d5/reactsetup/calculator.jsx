import React from 'react';

class Calculator extends React.Component{
  constructor(props){
    super(props);
    this.state = { num1: "", num2: "", result: 0};
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.sum = this.sum.bind(this);
    this.subtraction = this.subtraction.bind(this);
    this.multiplication = this.multiplication.bind(this);
    this.division = this.division.bind(this);
    this.clear = this.clear.bind(this);
  }

  setNum1(event){
    event.preventDefault();
    this.setState({num1: event.currentTarget.value});
  }

  setNum2(event){
    event.preventDefault();
    this.setState({num2: event.currentTarget.value});
  }

  sum(event){
    event.preventDefault();
    const result = this.state.num1 + this.state.num2;
    this.setState({result});
  }

  subtraction(event){
    event.preventDefault();
    const result = this.state.num1 - this.state.num2;
    this.setState({result});
  }

  multiplication(event){
    event.preventDefault();
    const result = this.state.num1 * this.state.num2;
    this.setState({result});
  }

  division(event){
    event.preventDefault();
    const result = this.state.num1 / this.state.num2;
    this.setState({result});
  }

  clear(event){
    event.preventDefault();
    this.setState({ num1: "", num2: "", result: 0});
  }

  render(){
    let { a: num1, b: num2 } = { a: this.state.num1, b: this.state.num2 };
    return (
      <div>
        <form>
          <input type="text" onChange={this.setNum1} value={num1}></input>
          <input type="text" onChange={this.setNum2} value={num2}></input>
          <br />
          <button onClick={this.sum}>+</button>
          <button onClick={this.subtraction}>-</button>
          <button onClick={this.multiplication}>*</button>
          <button onClick={this.division}>/</button>
          <br />
          <button onClick={this.clear}>Clear</button>
        </form>

        <h1>{this.state.result}</h1>
      </div>
    );
  }
}

export default Calculator;
