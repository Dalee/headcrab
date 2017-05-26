class VacanciesItemPage extends React.Component {
  render () {
    const fullRelatedResumes = this.props.fullRelatedResumes.map(item => {
      return <RelatedResume key={item.id} id={item.id} link={item.links.self} name={item.name} salary={item.expectedSalary} />
    })

    const relatedResumes = this.props.relatedResumes.map(item => {
      return <RelatedResume key={item.id} id={item.id} link={item.links.self} name={item.name} salary={item.expectedSalary} />
    })

    return (
      <div className="vacancies-item">
        <div className="vacancies-item__head">
          <h1 className="vacancies-item__title">Просмотр вакансии</h1>
        </div>
        <div className="vacancies-item__body">
          <div className="vacancies-item__vacancy">
            <DetailVacancy contactInfo={this.props.vacancy.contactInfo}
                           title={this.props.vacancy.title}
                           skills={this.props.vacancy.skills}
                           salary={this.props.vacancy.salary} />
          </div>
          <div className="vacancies-item__related">
            <h4 className="vacancies-item__label">Полностью подходящие резюме:</h4>
            {fullRelatedResumes}
          </div>
          <div className="vacancies-item__related">
            <h4 className="vacancies-item__label">Частично подходящие резюме:</h4>
            {relatedResumes}
          </div>
        </div>
      </div>
    )
  }
}

VacanciesItemPage.defaultProps = {
  fullRelatedResumes: [],
  relatedResumes: []
}

VacanciesItemPage.propTypes = {
  vacancy: React.PropTypes.object,
  fullRelatedResumes: React.PropTypes.array,
  relatedResumes: React.PropTypes.array
}
