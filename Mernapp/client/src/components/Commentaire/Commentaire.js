import React from "react";
import { Button, FormGroup, FormControl, ControlLabel } from "react-bootstrap";
import API from "../../utils/API";
import 'materialize-css/dist/css/materialize.min.css'
import { CatPropos } from "../CatPropos/CatPropos";
import { Timestamp } from "mongodb";
import { Header } from "../Permanent/Header";

export class Commentaire extends React.Component {

  constructor(props){
    super(props);
    this.state = {
      contenu: "",
      proposId : this.props.match.params.proposId,
      propos : "",
      allCommentaires : []
	  }

	this.getAllCommentaire = this.getAllCommentaire.bind(this);
  this.getProposId = this.getProposId.bind(this);
  this.like = this.like.bind(this)
  this.dislike = this.dislike.bind(this)
  this.likeCom = this.likeCom.bind(this)
  this.dislikeCom = this.dislikeCom.bind(this)

	this.getProposId();
	this.getAllCommentaire();
  }

  getProposId = async() => {
    const {proposId} = this.state;
    const cPropos = await API.getProposId(proposId);
    this.setState({propos : cPropos.data})
  }
  
  getAllCommentaire = async() => {
      const {allCommentaires, proposId} = this.state;
      const callCommentaire = await API.getAllCommentaire(proposId);
      this.setState({allCommentaires : callCommentaire.data})
      
  	  
  }

  likeCom = async(commentaireId) => {
    await API.likeCom({"commentaireId" : commentaireId});
	  this.getAllCommentaire();
  }

  dislikeCom = async(commentaireId) => {
    await API.dislikeCom({"commentaireId" : commentaireId});
	  this.getAllCommentaire();
  }

  like = async(proposId) => {
    await API.like({"proposId" : proposId});
    this.getProposId();
  }

  dislike = async(proposId) => {
    await API.dislike({"proposId" : proposId});
    this.getProposId();
  }


  send = async () => {
    const { contenu, proposId} = this.state;
    if (!contenu || contenu.length === 0) return;
    try {
	  const { data } = await API.addCommentaire({ contenu, proposId});
      window.location = "/"+ proposId + "/commentaire";
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
    const { contenu, propos, allCommentaires} = this.state;
    return (
      <div className = "Page">
        <Header />
        <div className="addPropos">
          <h3>Ecrivez votre commentaire</h3>
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
            Ajouter le commentaire
          </Button>

          <div className="row">
            <div className="col s12 m6">
              <div className="card blue-grey darken-1">
                <div className="card-content white-text">
                  <span className="card-title">  PROPOS // like :{propos.likes} </span>
                  Categorie : {propos.categorie}
                  <p>Description : {propos.contenu}</p>
                </div>
                <div className="card-action">
                  <a href = "/propos">retour aux propos</a>
                  <a href = {"/" + propos._id + "/reponse"}>Reponses</a>
                </div>
                <div className="card-action">
                  <Button onClick={() => this.like(propos._id)} block bsSize="large" type="submit">
                    Like
                  </Button>
                  <Button onClick={() => this.dislike(propos._id)} block bsSize="large" type="submit">
                    Dislike
                  </Button>
                </div>                
              </div>
            </div>
          </div>
          
          {
            allCommentaires.map
              ((commentaire, i) => 
                {
                  return(
                    <div className="row" key={i}>
                      <div className="col s12 m6">
                        <div className="card blue-grey darken-1">
                          <div className="card-content white-text">
                            <span className="card-title">  // like : {commentaire.likes} </span>
                            <p>{commentaire.contenu}</p>
                          </div>
                          <div className="card-action">
                          <div className="card-action">
                            <Button onClick={() => this.likeCom(commentaire._id)} block bsSize="large" type="submit">
                              Like
                            </Button>
                            <Button onClick={() => this.dislikeCom(commentaire._id)} block bsSize="large" type="submit">
                              Dislike
                            </Button>
                          </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  )
                }
              )
          }
        </div>
      </div>
	)
  }
}
