import { Router } from "express";
import { methods as LanguageController } from "./../controllers/language.controller";

const router  = Router();

router.get("/", LanguageController.getLanguages);
router.get("/:id", LanguageController.getLanguage);
router.post("/", LanguageController.addLanguages);
router.delete("/:id", LanguageController.deleteLanguage);
router.put("/:id", LanguageController.updateLanguage);

export default router;