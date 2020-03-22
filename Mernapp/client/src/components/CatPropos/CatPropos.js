import React from "react";
import { Button, FormGroup, FormControl, ControlLabel } from "react-bootstrap";
import API from "../../utils/API";
import { Header } from "../Permanent/Header";

export class CatPropos extends React.Component {

  constructor(propos){
    super(propos);
    this.state = {
      contenu: "",
      allCatPropos : [],
      allCatReponse : []
  	}

	this.getAllCatPropos = this.getAllCatPropos.bind(this);

  this.getAllCatReponse = this.getAllCatReponse.bind(this);

  this.cReponse = this.cReponse.bind(this);

  this.cPropos = this.cPropos.bind(this);

  this.getAllCatReponse();

  this.getAllCatPropos();
  
  }

  getAllCatPropos = async() => {
    const callCatPropos = await API.getAllCatPropos();
    this.setState({allCatPropos : callCatPropos.data})
}

  getAllCatReponse = async() => {
    const callCatReponse= await API.getAllCatReponse();
    this.setState({allCatReponse : callCatReponse.data})
  }

  cPropos = async () => {
    const {contenu} = this.state;
    if (!contenu || contenu.length === 0) return;
    try {
      await API.addCatPropos({"contenu" : contenu});
      this.getAllCatPropos();
    } catch (error) {
      console.error(error);
    }
  };

  cReponse = async () => {
    const {contenu} = this.state;
    if (!contenu || contenu.length === 0) return;
    try {
      await API.addCatReponse({"contenu" : contenu});
      this.getAllCatReponse();
    } catch (error) {
      console.error(error);
    }
  };
  
  handleChange = (event) => {
    this.setState({
      [event.target.id]: event.target.value
    });
  };
  
  render() {
    const {contenu, allCatPropos, allCatReponse} = this.state;
    return (
      <div className = "Page">
        <Header />
        <FormGroup controlId="contenu" bsSize="large">
            <ControlLabel>Categorie</ControlLabel>
            <FormControl
              autoFocus
              type="contenu"
              value={contenu}
              onChange={this.handleChange}
            />
          </FormGroup>
        <div className="CategorieP">
          <h3> Categorie Propos</h3>
          <Button onClick={() => this.cPropos()} block bsSize="large" type="submit">
            Ajouter la categorie Propos
          </Button>
          {
            allCatPropos.map
              ( (CatPropos, i) => 
                {
                  return(
                    <div className = "Catpropos" key = {i}>
                      {CatPropos.contenu}
                    </div>
                  )
                }
              )
          }

          </div>

          <div className="CategorieR">
            <h3> Categorie Reponse</h3>
            {
              allCatReponse.map
                ( (CatReponse, j) => 
                  {
                    return(
                      <div className = "Catpropos" key = {j}>
                        {CatReponse.contenu}
                      </div>
                    )
                  }
                )
            }

            <Button onClick={() => this.cReponse()} block bsSize="large" type="submit">
              Ajouter la categorie Rep
            </Button>
         </div>
      </div>
	)
  }
}