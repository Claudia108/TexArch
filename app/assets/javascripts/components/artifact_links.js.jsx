class ArtifactLinks extends React.Component {
  render () {
    if(this.props.user) {
      var buttonContent =
        <div>
          <div className="col-md-4">
            <a href="/Andice" className="btn btn-primary">Andice Points</a>
          </div>
          <div className="col-md-4">
            <a href="/Calf Creek" className="btn btn-primary">Calf Creek Points</a>
          </div>
          <div className="col-md-3">
            <a href="/Bell" className="btn btn-primary">Bell Points</a>
          </div>
        </div>
    } else {
      var buttonContent =
        <div className="col-md-12">
          <a href="/auth/google_oauth2" className="btn btn-primary offset-center">Please Login to See The Data</a>
        </div>
    }

    return (
      <div className="row point-button">
        <div className="col-md-1">
        </div>
        {buttonContent}
      </div>
    )
  }
}
