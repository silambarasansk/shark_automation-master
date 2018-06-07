class SearchPage
  SEARCH_ICON_CSS = '.fa.fa-search.search-icon'
  SEARCH_FIELD_CSS = '.search-input.form-control.form-control'
  SEARCH_ICON_PRESS_CSS = '.search-box-button.btn.btn-primary'
  def initialize(session)
    @session=session
  end

  def search_loan(loan_number)
      if(@session.has_css?(SEARCH_ICON_CSS))
          @session.find(SEARCH_ICON_CSS).hover
          @session.find(SEARCH_FIELD_CSS).set loan_number
          @session.find(SEARCH_ICON_PRESS_CSS).click
        else
          @session.find(SEARCH_FIELD_CSS).set loan_number
          @session.find(SEARCH_ICON_PRESS_CSS).click
        end
  end
end
