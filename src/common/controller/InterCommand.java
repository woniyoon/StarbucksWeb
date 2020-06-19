package common.controller;

import javax.servlet.http.*;

public interface InterCommand {
	void execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
