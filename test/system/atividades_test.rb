require "application_system_test_case"

class AtividadesTest < ApplicationSystemTestCase
  setup do
    @atividade = atividades(:one)
  end

  test "visiting the index" do
    visit atividades_url
    assert_selector "h1", text: "Atividades"
  end

  test "should create atividade" do
    visit atividades_url
    click_on "New atividade"

    fill_in "Data", with: @atividade.data
    fill_in "Hora final", with: @atividade.hora_final
    fill_in "Hora inicio", with: @atividade.hora_inicio
    fill_in "Nome", with: @atividade.nome
    fill_in "Status", with: @atividade.status
    click_on "Create Atividade"

    assert_text "Atividade was successfully created"
    click_on "Back"
  end

  test "should update Atividade" do
    visit atividade_url(@atividade)
    click_on "Edit this atividade", match: :first

    fill_in "Data", with: @atividade.data
    fill_in "Hora final", with: @atividade.hora_final
    fill_in "Hora inicio", with: @atividade.hora_inicio
    fill_in "Nome", with: @atividade.nome
    fill_in "Status", with: @atividade.status
    click_on "Update Atividade"

    assert_text "Atividade was successfully updated"
    click_on "Back"
  end

  test "should destroy Atividade" do
    visit atividade_url(@atividade)
    click_on "Destroy this atividade", match: :first

    assert_text "Atividade was successfully destroyed"
  end
end
