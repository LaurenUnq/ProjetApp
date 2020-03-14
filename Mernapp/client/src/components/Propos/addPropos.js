import React from "react";
import { Button, FormGroup, FormControl, ControlLabel } from "react-bootstrap";
import API from "../../utils/API";

export class addPropos extends React.Component {

  state = {
    contenu: "",
	categorie:"",
    user: ""
  };
  
  send = async () => {
    const { contenu, categorie, user} = this.state;
    if (!contenu || contenu.length === 0) return;
    if (!categorie || categorie.length === 0) return;
    try {
	console.log("addd prpos")
	  const { data } = await API.addPropos({ contenu, categorie, user });
	  console.log("add propos22")
      localStorage.setItem("token", data.token);
      window.location = "/dashboard";
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
    const { contenu, categorie, user} = this.state;
    return (
      <div className="addPropos">
        <FormGroup controlId="categorie" bsSize="large">
          <ControlLabel>Categorie</ControlLabel>
          <FormControl
            autoFocus
            type="categorie"
            value={categorie}
            onChange={this.handleChange}
          />
        </FormGroup>

		<FormGroup controlId="contenu" bsSize="large">
          <ControlLabel>Contenu</ControlLabel>
          <FormControl
            autoFocus
            type="contenu"
            value={contenu}
            onChange={this.handleChange}
          />
        </FormGroup>

        <Button onClick={this.send} block bsSize="large" type="submit">
          Ajouter le propos
        </Button>
      </div>
	)
  }
}