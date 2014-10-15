/** @jsx React.DOM */

var CanvadaptiveApp = React.createClass({
   render: function () {
       return <div>
            <TestIndex testName={this.props.title} />
           </div>
   }
});