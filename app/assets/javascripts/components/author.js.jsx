class Author extends React.Component {
  render () {
    return (
      <aside className="author right-side col-md-4 shadow-element">
        <h4>Sergio Ayala, Coordinator </h4>
        <section className="row">
          <img src="/images/sergio.jpg" className="welcome-image img-rounded sergio-image"
          alt="Sergio Ayala"/>
          <article className="welcome-text">
            <p>Sergio is an archaeologist from the Gault School of
              Archaeological Research. His research focuses on
              lithic analysis and experimental knapping in order to
              conduct research regarding technological behaviors of
              prehistoric people.  Currently, he is working on the
              technological behaviors embedded in the production of the
              Calf Creek Horizon projectile point technologies
              (Andice, Bell and Calf Creek).</p>
          </article>
        </section>
      </aside>
    )
  }
}
