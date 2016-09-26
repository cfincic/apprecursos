require "test_helper"

class AbstractMapperTest < ActiveSupport::TestCase

  def setup
    @abstract_mapper = AbstractMapper.new
  end

  test 'debe responder a mappear' do
    @abstract_mapper.must_respond_to :mappear
  end

  test 'mappear no debe estar implementado' do
    e = proc{ @abstract_mapper.mappear(nil, nil) }.must_raise NotImplementedError
    e.message.must_equal('Debe implementarse el método mappear')
  end

end
