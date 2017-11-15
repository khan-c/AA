import React from 'react';

import GiphysIndexItem from './giphys_index_item';

class GiphysIndex extends React.Component {
  constructor(props){
    super(props);
  }

  render() {
    const { giphys } = this.props;
    const gifs = giphys.map( gif => (
      <GiphysIndexItem
        key={ gif.id }
        gif={ gif }/>
    ));

    return(
      <div>
        { gifs }
      </div>
    );
  }
}

export default GiphysIndex;
