class UserNavbar extends React.Component {
  render () {
    if (this.props.admin) {
      var adminNav =
        <ul className="nav navbar-nav navbar-right">
          <li><a href="/admin/users">Users</a></li>
          <li><a href="/admin/dashboard">Dashboard</a></li>
          <li><a href="#">Welcome {this.props.user.first_name}</a></li>
          <li><a href="/logout">Logout</a></li>
        </ul>

      var adminArtifact =
        <ul className="dropdown-menu" area-labelledby="dLabel">
          <li><a href="/Andice">Andice Points</a></li>
          <li><a href="/Bell">Bell Points</a></li>
          <li><a href="/Calf Creek">Calf Creek Points</a></li>
          <li role="separator" className="divider"></li>
          <li><a href="/admin/artifacts/new">Add an Artifact</a></li>
        </ul>

    } else {
      var adminNav =
        <ul className="nav navbar-nav navbar-right">
          <li><a href="#">Welcome {this.props.user.first_name}</a></li>
          <li><a href="/logout">Logout</a></li>
        </ul>

      var adminArtifact =
        <ul className="dropdown-menu" area-labelledby="dLabel">
          <li><a href="/Andice">Andice Points</a></li>
          <li><a href="/Bell">Bell Points</a></li>
          <li><a href="/Calf Creek">Calf Creek Points</a></li>
        </ul>
    }

    return (
      <div className="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul className="nav navbar-nav">
          <li><a href="/sites">Sites</a></li>
          <li><a href="/map">Map</a></li>

          <li className="dropdown artifact-nav">
            <a id="dLabel" data_target="#" href="/artifacts" className="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Artifacts<span className="caret"></span></a>
            {adminArtifact}
          </li>
          <li><a href="/videos">Videos</a></li>
        </ul>
        {adminNav}
      </div>
    )
  }
}
