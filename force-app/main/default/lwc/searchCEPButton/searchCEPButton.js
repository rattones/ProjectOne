import { LightningElement, api, track, wire } from 'lwc';
import findCEP from '@salesforce/apex/CEPController.findCEP';
import saveBillingAddress from '@salesforce/apex/AccountController.saveBillingAddress';
import saveShippingAddress from '@salesforce/apex/AccountController.saveShippingAddress';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class SearchCEPButton extends LightningElement {

    /**
     * @api recordId - id do registro
     *
     * @track - expor informações entre componentes (lwc -> lwc/visualforce)
     *
     * @wire - utiliza o recordId da página e não pode atualizar o objeto
     */

    cep= null;
    logradouro= null;
    complemento= null;
    bairro= null;
    localidade= null;
    uf= null;
    ddd= null;

    @api recordId;

    // @wire(findCEP, {cep: this.cep})
    // wiredCEP ({error, data}) {

    // } carrega dados na inicialização do componente

    handleCEPChange(event) { this.cep = event.detail.value; }
    handleLogradouroChange(event) { this.logradouro = event.detail.value; }
    handleComplementoChange(event) { this.complemento = event.detail.value; }
    handleBairroChange(event) { this.bairro = event.detail.value; }
    handleLocalidadeChange(event) { this.localidade = event.detail.value; }
    handleUFChange(event) { this.uf = event.detail.value; }
    handleDDDChange(event) { this.ddd = event.detail.value; }

    // const address= {

    // }

    // getAddress() {

    //     return address;
    // }

    handleClick(event) {
        event.preventDefault();
        // console.dir(this.cep);

        findCEP({cep: this.cep})
            .then(response=> {
                // this.response= JSON.parse(response);
                // console.log(response);
                this.logradouro= response.logradouro;
                this.complemento= response.complemento;
                this.bairro= response.bairro;
                this.localidade= response.localidade;
                this.uf= response.uf;
                this.ddd= response.ddd;
            })
    }

    handleAddToBillingAddress(event) {
        const address= {
            cep: this.cep,
            logradouro: this.logradouro,
            complemento: this.complemento,
            bairro: this.bairro,
            localidade: this.localidade,
            uf: this.uf,
            ddd: this.ddd
        };
        console.log('record');
        console.dir(address);

        saveBillingAddress({address: address, accountId: this.recordId})
            .then(response=> {
                // console.dir(response);
                this.handleSuccess('Billing');
            }).catch(error=> {
                // console.dir(error);
                this.handleError('Billing');
            });
    }

    handleAddToShippingAddress(event) {
        const address= {
            cep: this.cep,
            logradouro: this.logradouro,
            complemento: this.complemento,
            bairro: this.bairro,
            localidade: this.localidade,
            uf: this.uf,
            ddd: this.ddd
        };
        console.log('record');
        console.dir(address);

        saveShippingAddress({address: address, accountId: this.recordId})
            .then(response=> {
                // console.dir(response);
                this.handleSuccess('Shipping');
            }).catch(error=> {
                // console.dir(error);
                this.handleSuccess('Shipping');
            });
    }

    handleSuccess(address) {
        const event= new ShowToastEvent({
            title: 'Sucesso',
            message: 'Address saved to '+address,
            variant: 'success'
        });

        this.dispatchEvent(event);
    }

    handleError(address) {
        const event= new ShowToastEvent({
            title: 'Error',
            message: 'Address NOT saved to '+address,
            variant: 'error'
        });

        this.dispatchEvent(event);
    }
}
