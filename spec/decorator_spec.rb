require_relative '../decorator'

describe Decorator do
  it 'has a name' do
    decorator = Decorator.new('JakeandLekan')
    expect(decorator).to have_attributes(nameable: 'JakeandLekan')
  end
end

describe CapitalizeDecorator do
  it 'Capitalizes name' do
    decorator = CapitalizeDecorator.new('jakeandLekan')
    expect(decorator).to respond_to(:correct_name)
  end
end

describe TrimmerDecorator do
  it 'Trims name' do
    decorator = TrimmerDecorator.new('JakeandLekan')
    expect(decorator).to respond_to(:correct_name)
  end
end
