require 'rails_helper'
require 'spec_helper'

describe ProfileController do
  describe 'Checking show controller' do
    it 'should call correct model methods and render correct page' do

      Profile.should_receive(:where).with(:user_id => "1").and_return([{:phone => '1234567890', :name=> "foo1"}, {:phone => '1234567890', :name=> "foo2"}])
      Ppublication.should_receive(:where).with(:user_id => "1").and_return("bar")
      Keyword.should_receive(:get_for_user).with("1").and_return("baz")

      get :show, {'id' => '1'}
      assigns(:user).should == '1'
      assigns(:profile).should == {"phone" => '1234567890', "name"=> "foo1"}
      assigns(:publications).should == 'bar'
      assigns(:keywords).should == 'baz'

      response.should render_template('show')
    end
  end

  describe 'Checking edit controller' do
    it 'should call correct model methods and render correct page' do
      Profile.should_receive(:where).with(:user_id => "1").and_return(["foo1", "foo2"])
      Ppublication.should_receive(:where).with(:user_id => "1").and_return("bar")
      Keyword.should_receive(:get_for_user).with("1").and_return("baz")

      get :edit, {'id' => '1'}
      assigns(:user).should == '1'
      assigns(:profile).should == 'foo1'
      assigns(:publications).should == 'bar'
      assigns(:keywords).should == 'baz'

      response.should render_template('edit')
    end
  end

  describe 'Checking update controller' do
    it 'should call correct model methods and render correct page' do
      mocked_profile = double('profile1')
      mocked_profile.should_receive(:update_attributes).with('user').and_return(true)
      Profile.should_receive(:where).with(:user_id => "1").and_return([mocked_profile, "foo2"])

      Ppublication.should_receive(:update).with({:id => "1", :data => 'foo'})
      Pkeyword.should_receive(:update).with({:id => "1", :data => 'bar'})

      put :update, :id => "1", :user => 'user', :pub => 'foo', :keyword => 'bar'
    end
  end

end