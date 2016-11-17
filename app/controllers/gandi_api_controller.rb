class GandiApiController < ApplicationController
  def index

    api = Gandi::Session.new(ENV["GandiapiKey"], env: :test) # Endpoint: https://rpc.gandi.net/xmlrpc/

    #params:
    # params['auth'].gsub(/["]/, '') => "IWeh8bYdFlEm"
    # params['ndd']=> "mobicafe.fr"


    api.domain.transferin.available('mobicafe.fr', authinfo = 'X2pNNIqKdBTL') #transférer le NDD name to this controller ,'X2pNNIqKdBTL'

     #midifier les infos ci-dessous pour voir si le transfert fonctionne
     raise
     contact_spec = {
    'city' => 'Paris',
    'country' => 'FR',
    'email' => 'julien@zenchef.com',
    'family' => 'Balmont',
    'given' => 'Matthias',
    'password' => '0000000',
    'phone' => '0688833732',
    'streetaddr' => '120 rue Reaumur',
    'type' => 1,
    'orgname' => 'SAS Zenchef',
  }




      api.contact.create(contact_spec)

      api.contact.can_associate_domain('MV22-GANDI',  contact_spec)

    transfer_spec = {
    'owner' => 'MV22-GANDI',
    'admin' => 'MV22-GANDI',
    'tech' => 'MV22-GANDI',
    'bill' => 'MV22-GANDI',
    }


    api.domain.transferin.proceed('mobicafe.fr', transfer_spec) #le statut du code d'autorisation est en pending api.domain.available(['mobicafe.fr'])
 # voir les infos du reseller
    api.operation.info(oper_id)

  end

  def show
  end
end
