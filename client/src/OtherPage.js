import React from 'react';
import { Link } from 'react-router-dom';

export default () => {
  return (
    <div>
      Im some other page
      <div><Link to="/">Go back to home page!</Link></div>
      <div><Link to="http://jaynejacobs.com">Jayne's Website</Link></div>
      <div><Link to="https://gopherclub.jaynejacobs.com/">Gopher Club</Link></div>
    </div>
  );
};
