import React from 'react';
import { Row, Col } from 'react-bootstrap';
import 'bootstrap/dist/css/bootstrap.min.css';
import './styling/RecipeRandom.css';
import { MDBLink } from "mdbreact"
import { MDBCard, MDBCardBody, MDBCardTitle, MDBCardText, MDBCardHeader, MDBBtn, MDBContainer } from "mdbreact";
import '../App.css';
import FCLogo from '../images/FClogo.JPG'


export default function RecipeRandom(props) {

    return (
        <div className="recipeoftheday">

            <MDBContainer class="justify-content-center">
                <Row class="row justify-content-md-center"> 

                    <Col class="col-sm-auto">
                        <MDBCard style={{ width: "auto", marginTop: "1rem" }} className="text-center">
                            <img src={FCLogo}/>
                        </MDBCard>
                    </Col>

                    <Col class="col-sm-auto">
                    <MDBCard style={{ width: "auto", marginTop: "1rem" }} className="text-center">
                        <MDBCardHeader color="peach-gradient">STAFF PICKED RECIPE OF THE DAY</MDBCardHeader>
                        <MDBCardBody class="text-center-2">
                        <MDBLink to={`/recipes/${props.recipe.id}`} className="btn btn-warning">VIEW RECIPE</MDBLink>
                        </MDBCardBody>
                    </MDBCard>
                    </Col>
                </Row>
            </MDBContainer>
        </div>
    )
};
