class MapImage extends React.Component {
  render () {
    var image = <img src="/images/Figure1.jpg" className="welcome-image img-rounded" alt="Geographic Range"/>
    if (this.props.user) {
      var mapImage =
        <a href="/map">
          {image}
        </a>
    } else {
      var mapImage = image
    }

    return (
      <div className="col-md-5 shadow-element padded">
        <h4>Geographic Range of the Calf Creek Horizon</h4>
        {mapImage}
      </div>
    )
  }
}
