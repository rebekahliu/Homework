import React from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component{
  constructor(){
    super();
    this.state = { searchTerm:"" };

    this.handleChange = this.handleChange.bind(this);
    this.handleClick = this.handleClick.bind(this);
  }

  componentDidMount() {
  this.props.fetchSearchGiphys('golden+retriever');
  }

  handleChange(event){
    event.preventDefault();
    this.setState({ searchTerm: event.currentTarget.value });
  }

  handleClick(event){
    event.preventDefault();
    let searchTerm = this.state.searchTerm.split(' ').join('+');
    this.props.fetchSearchGiphys(searchTerm);
  }

  render(){
    return(
      <div>
        <form>
          <input onChange={this.handleChange} value={this.state.searchTerm}></input>
          <button onClick={this.handleClick}>Search Giphy</button>
        </form>
        <GiphysIndex giphys={this.props.giphys}/>
      </div>
    );
  }
}

export default GiphysSearch;
