import fillPageService from "../services/fillPageService.js";


const fillRequestsPageController = async (req,res,next)=>{
    const {uId}=req.body;
    const msg =await fillPageService.fillRequestsPage(uId);
    res.json({msg});
}

const fillFriendsPageController = async (req,res,next)=>{
    const {uId}=req.body;
    const msg =await fillPageService.fillFriendsPage(uId);
    res.json({msg});
}

const fillUsersPageController = async (req,res,next)=>{
    const {uId}=req.body;
    const msg =await fillPageService.fillUsersPage(uId);
    res.json({msg});
}


export default {fillRequestsPageController,fillFriendsPageController,fillUsersPageController};